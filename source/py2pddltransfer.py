
import sys
from py2pddl_multiprob.py2pddl.parse import parse
import os

# def process_pddl_files(root_folder, output_folder):
#     if not os.path.exists(output_folder):
#         os.makedirs(output_folder)

#     for dirpath, dirnames, filenames in os.walk(root_folder):
#         for filename in filenames:
#             if filename.endswith(".py"):
#                 input_filepath = os.path.join(dirpath, filename)
#                 output_filepath = os.path.join(output_folder, os.path.relpath(input_filepath, root_folder))
#                 output_dir = os.path.dirname(output_filepath)
                
#                 if not os.path.exists(output_dir):
#                     os.makedirs(output_dir)

#                 with open(input_filepath, "r") as input_file:
#                     input_text = input_file.read()
#                     pddl_contents = extract_pddl_contents(input_text)
                
#                 with open(output_filepath, "w") as output_file:
#                     output_file.write(pddl_contents)
                    
# if __name__ == "__main__":
#     root_folder = "processed_output_py/gpt-4"  
#     output_folder = "processed_output_py"  
#     process_pddl_files(root_folder, output_folder)
#     print("Preprocess over")


# import os

# import os

def concatenate_files(id_folder):
    # 获取所有文件名
    file_names = os.listdir(id_folder)
    
    # 找到domain.py文件
    domain_file = None
    other_files = []
    
    for file_name in file_names:
        if file_name == "domain.py":
            domain_file = os.path.join(id_folder, file_name)
        elif file_name.endswith(".py") and not file_name.startswith("domain"):
            other_files.append(os.path.join(id_folder, file_name))
    
    if domain_file is None:
        print(f"Domain file not found in {id_folder}")
        return
    
    # 读取domain.py文件内容
    with open(domain_file, 'r') as domain_file:
        domain_content = domain_file.read()
    
    # 针对每个其他文件，将其与domain.py拼接
    for other_file in other_files:
        with open(other_file, 'r') as file:
            other_content = file.read()
            combined_content = "from py2pddl import goal, init\n"+domain_content + other_content
            
            # 创建新的domain-其他文件名字.py文件
            new_file_name = f"domain-{os.path.basename(other_file)}"
            new_file_path = os.path.join(id_folder, new_file_name)
            # os.remove(new_file_path)
            with open(new_file_path, 'w') as new_file:
                new_file.write(combined_content)
    
if __name__ == "__main__":
    base_directory = "processed_output_py/gpt-4"  # 修改为你的文件夹路径

    for id_folder in os.listdir(base_directory):
        if os.path.isdir(os.path.join(base_directory, id_folder)):
            concatenate_files(os.path.join(base_directory, id_folder))
        for file_name in os.listdir(os.path.join(base_directory, id_folder)):
            if file_name.endswith(".py") and file_name.startswith("domain-problem"):
                try:
                    parse(os.path.join(base_directory, id_folder, file_name), domain=os.path.join(base_directory, id_folder,"domain"), problem=os.path.join(base_directory, id_folder,file_name[7:-3]))
                except Exception as e:
                    print(f"Error parsing {file_name}: {e}")


# if __name__ == "__main__":
#     base_directory = "processed_output_py/gpt-4"  # 修改为你的文件夹路径
    
#     for id_folder in os.listdir(base_directory):
#         if os.path.isdir(os.path.join(base_directory, id_folder)):
#             new_py_file = concatenate_files(os.path.join(base_directory, id_folder))
#             if new_py_file:
#                 # 调用你的parser()函数，传入新的.py文件路径
#                 parser(new_py_file,domain="domain",problem="problem")