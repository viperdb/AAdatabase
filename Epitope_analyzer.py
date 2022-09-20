import DatabaseConnection as db
import Debug_Control as debug
import getopt
import sys

class Epitope_analyzer_db:
    def __init__(self):
        self.antibody_key_words = "FAB|ANTIBODY|HEAVY|LIGHT"

    def get_antibody_chains(self, PDB):
        sql = f"SELECT chain FROM epitope_analyzer.PDB_Mol_Info " \
              f"WHERE Mol_Name REGEXP '{self.antibody_key_words}' and Pdb='{PDB}'"
        return db.getDataFromAQuerry(sql)

    def get_antigen_chains(self, PDB):
        sql = f"SELECT chain FROM epitope_analyzer.PDB_Mol_Info " \
              f"WHERE NOT Mol_Name REGEXP '{self.antibody_key_words}' and Pdb='{PDB}'"
        return db.getDataFromAQuerry(sql)

    def print_data(self,data):
        strchain = ""
        for d in data:
            strchain += d[0] + ","
        print(strchain[:-1])


def arguments_parsing():
    global PDB_path
    OPTIONS = {}
    if len(sys.argv) > 1:
        debug.print_info(f"pdb parse:{sys.argv[1:]}")
        try:
            opts, args = getopt.getopt(sys.argv[1:], "", ["pdb=", "antibody" ])
        except getopt.GetoptError as err:
            debug.print_error(f"Parameters error {err}")
            exit(2)

        OPTIONS["antibody"] = False

        for opt, arg in opts:
            if opt == "--pdb":
                OPTIONS["PDB"] = arg
            elif opt == "--antibody":
                OPTIONS["antibody"] = True
                PDB_path = arg

        debug.change_config()
        return OPTIONS
    else:
        print("Parameters missing using defaults from [config.ini]")
        print(" --pdb pdb structure")
        print(" --antibody antibody")
        exit(2)
    print("Wait")


if __name__ == "__main__":
    options = arguments_parsing()
    EA = Epitope_analyzer_db()

    if options["antibody"]:
        EA.print_data(EA.get_antibody_chains(options["PDB"]))
    else:
        EA.print_data(EA.get_antigen_chains(options["PDB"]))