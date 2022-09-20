from prody import *
import Debug_Control as debug
import getopt
import sys


class PDB_spliter:
    def __init__(self, pdb_path, chains1, chains2):
        self.pdb = pdb_path
        self.chains1 = chains1
        self.chains2 = chains2
        self.pdb_atoms = parsePDB(pdb_path)
        self.header = parsePDBHeader(pdb_path)
        self.output_path = ""
        pass

    def split_files(self, section):
        chains = ""
        output_path = self.output_path
        if section == 1:
            chains = ' '.join(self.chains1)
            output_path += "antigens"
        else:
            output_path += "antibody"
            chains = ' '.join(self.chains2)

        strselection = "chain "+ chains
        chain_selection= self.pdb_atoms.select(strselection)
        writePDB(f"{output_path}/{self.header['identifier']}_{chains}.pdb", chain_selection)



def arguments_parsing():
    OPTIONS = {}
    if len(sys.argv) > 1:
        debug.print_info(f"pdb parse:{sys.argv[1:]}")
        try:
            opts, args = getopt.getopt(sys.argv[1:], "", ["pdb=", "input_path=", "output_path=",
                                                          "antigen=", "antibody=" ])
        except getopt.GetoptError as err:
            debug.print_error(f"Parameters error {err}")
            exit(2)

        for opt, arg in opts:
            if opt == "--pdb":
                OPTIONS["PDB"] = arg
            elif opt == "--input_path":
                OPTIONS["input_path"] = arg
            elif opt == "--output_path":
                OPTIONS["output_path"] = arg
            elif opt == "--antibody":
                OPTIONS["antibody"] = arg.split(',')
            elif opt == "--antigen":
                OPTIONS["antigen"] = arg.split(',')

        debug.change_config()
        return OPTIONS
    else:
        print("Parameters missing")
        print(" --pdb pdb structure")
        print(" --antigen antigen chains")
        print(" --antibody antibody chains")
        print(" --input_path input path")
        print(" --output_path output path")
        exit(2)
    print("Wait")


if __name__ == "__main__":

    parameters = arguments_parsing()
    #pdb_path = "/home/dante/PDB_antibody/pdb5xs7.pdb"
    if "input_path" in parameters:
        pdb_path = f"{parameters['input_path']}/{parameters['PDB']}"
    else:
        pdb_path = parameters['PDB']
    objpdb = PDB_spliter(pdb_path, parameters['antigen'], parameters['antibody'])

    if "output_path" in parameters:
        objpdb.output_path = parameters["output_path"]

    objpdb.split_files(1)
    objpdb.split_files(2)