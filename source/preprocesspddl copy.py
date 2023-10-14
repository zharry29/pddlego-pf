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
    matches = re.findall(r"```(.*?)```", input_text, re.DOTALL)
    if len(matches) > 0:
        if matches[0][:6]=="python":
            matches[0] = matches[0][6:]
        return matches[0]
    return input_text

def process_pddl_files(root_folder, output_folder):
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    for dirpath, dirnames, filenames in os.walk(root_folder):
        for filename in filenames:
            if filename.endswith(".py"):
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
    root_folder = "output_python/wikihow"  
    output_folder = "processed_output_py"  
    process_pddl_files(root_folder, output_folder)
    print("Preprocess over")
# input_text = '''Sure, here is the PDDL domain file:

# ```python
# from py2pddl import Domain, create_type
# from py2pddl import predicate, action

# class SurvivalIslandDomain(Domain):

#     Water = create_type("Water")
#     Fish = create_type("Fish")
#     Fire = create_type("Fire")
#     Island = create_type("Island")

#     @predicate(Fish, Island)
#     def fish_at(self,  , i):
#         """Complete the method signature and specify
#         the respective types in the decorator"""

#     @predicate(Water, Island)
#     def water_at(self, w, i):
#         """Complete the method signature and specify
#         the respective types in the decorator"""

#     @predicate(Fire, Island)
#     def fire_at(self, fi, i):
#         """Complete the method signature and specify
#         the respective types in the decorator"""

#     @action(Fish, Island)
#     def catch(self, f, i):
#         precond = [self.fish_at(f, i)]
#         effect = [~self.fish_at(f, i)]
#         return precond, effect

#     @action(Water, Island)
#     def clean(self, w, i):
#         precond = [self.water_at(w, i)]
#         effect = []
#         return precond, effect

#     @action(Island)
#     def escape(self, i):
#         precond = []
#         effect = []
#         return precond, effect

#     @action(Fire, Island)
#     def start(self, fi, i):
#         precond = []
#         effect = [self.fire_at(fi, i)]
#         return precond, effect
# ```'''
# matches = re.findall(r"```python(.*?)```", input_text, re.DOTALL)
# print(matches)
