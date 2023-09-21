import os
import re

# def process_pddl_files(root_folder, output_folder):
#     if not os.path.exists(output_folder):
#         os.makedirs(output_folder)

#     for dirpath, dirnames, filenames in os.walk(root_folder):
#         for filename in filenames:
#             if filename.endswith(".pddl"):
#                 input_filepath = os.path.join(dirpath, filename)
#                 output_filepath = os.path.join(output_folder, os.path.relpath(input_filepath, root_folder))
#                 output_dir = os.path.dirname(output_filepath)
                
#                 if not os.path.exists(output_dir):
#                     os.makedirs(output_dir)

#                 with open(input_filepath, "r") as input_file:
#                     input_text = input_file.read()
#                     start_idx = input_text.find("(")
#                     end_idx = input_text.rfind(")")
#                     if start_idx != -1 and end_idx != -1 and start_idx < end_idx:
#                         extracted_text = input_text[start_idx:end_idx+1]
#                         with open(output_filepath, "w") as output_file:
#                             output_file.write(extracted_text)
def extract_pddl_contents(input_text):
    start_idx = input_text.find("(")
    end_idx = input_text.rfind(")")
    if start_idx != -1 and end_idx != -1 and start_idx < end_idx:
        extracted_text = input_text[start_idx:end_idx+1]
        return extracted_text
    return ""

def process_pddl_files(root_folder, output_folder):
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    for dirpath, dirnames, filenames in os.walk(root_folder):
        for filename in filenames:
            if filename.endswith(".pddl"):
                input_filepath = os.path.join(dirpath, filename)
                output_filepath = os.path.join(output_folder, os.path.relpath(input_filepath, root_folder))
                output_dir = os.path.dirname(output_filepath)
                
                if not os.path.exists(output_dir):
                    os.makedirs(output_dir)

                with open(input_filepath, "r") as input_file:
                    input_text = input_file.read()
                    pddl_contents = extract_pddl_contents(input_text)
                
                with open(output_filepath, "w") as output_file:
                    output_file.write(pddl_contents)
                    
if __name__ == "__main__":
    root_folder = "output/wikihow"  
    output_folder = "processed_output"  
    process_pddl_files(root_folder, output_folder)
    print("Preprocess over")
