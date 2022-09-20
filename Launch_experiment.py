from pathlib import Path
import os
import subprocess
from multiprocessing import Pool

file_path = "/home/james/Snugdock/1G01lineage/MisBrev/"

output_path = "/home/dante/james/B-Bris08_T_01_maps/"
path_obj = ""


def generate_input_files():
    for pdb_obj in path_obj.glob("*.gz"):
        print(str(pdb_obj))
        json_file = "{\n"
        json_file += "\"Antybody_workflow.PDB"+"\":" +"\""+str(pdb_obj)+"\""
        json_file += "\n"
        json_file += "}"
        with open(f"{output_path}{pdb_obj.name[:-7]}.json", "w") as f:
            f.write(json_file)


def submit_job(input_file):
    #command = "curl -X 'POST' 'http://localhost:8000/api/workflows/v1' -H 'accept: application/json' " \
    #         "-H 'Content-Type: multipart/form-data' -F 'workflowSource=@/home/dante/cromwell/test.wdl' " \
    #         "-F 'workflowInputs=@/home/dante/cromwell/input.json;type=application/json'"
    command = "curl -X 'POST' 'http://localhost:8000/api/workflows/v1' -H 'accept: application/json' " \
          "-H 'Content-Type: multipart/form-data' -F 'workflowSource=@/home/dante/cromwell/workflow_9_ch_fixed.wdl' " \
          "-F 'workflowInputs=@{};type=application/json'".format(input_file)
    #os.system(command)
    #print(command)
    output = subprocess.check_output(command, shell=True)
    print(output)


def launch_jobs():
    list_of_inputs = list(output_json.glob("*.json"))
    for i in range(0, len(list_of_inputs)):
        submit_job(list_of_inputs[i])


def launch_job_native_process(pdb_file):
    str_output = str(pdb_file) + "\n"
    print(str_output)
    command = f"python3 /home/dante/PycharmProjects/AAdatabase/PDB_db_upload.py --pdb {pdb_file}  "
    output = subprocess.check_output(command, shell=True)
    command2 = f"python3 /home/dante/PycharmProjects/AAdatabase/NetworkAnalysis.py --pdb {pdb_file} --antigen A --antibody H,L "
    #print(command2)
    output2 = subprocess.check_output(command2, shell=True)
    str_output += "<Upload to DB> \n" + str(output) + "\n"
    str_output += "<Interactions> \n" + str(output2) + "\n"
    print(str_output)


def launch_jobs_2(subfolder):
    path_obj = Path(file_path+subfolder)
    list_of_inputs = list(path_obj.glob("*.pdb.gz"))
    print(f"Number of pdbs {len(list_of_inputs)}")
    pool_handler = Pool(20)
    pool_handler.map(launch_job_native_process, list_of_inputs)
    #launch_job_native_process(list_of_inputs[0])


if __name__ == "__main__":

   # for filename in os.listdir(file_path):
   #     print(filename)
   #      path_obj = Path(file_path+filename)
   #     generate_input_files()

    #path_obj = Path(file_path)
    #generate_input_files()
    output_json = Path(output_path)
    #generate_input_files()
    #launch_jobs()
    i = 0
    for directory in os.listdir(file_path):
        #if i > 0 :
        launch_jobs_2(directory)
        print(i, directory)
        i += 1




