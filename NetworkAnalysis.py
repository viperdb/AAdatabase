import math
import pathlib
import Debug_Control as debug
import Type_of_interactions as ti
import Build_Network as bn
import matplotlib.pyplot as plt
import networkx as nx
import numpy as np
import time
import Db_interactions as dbi
from pathlib import Path
from multiprocessing import Pool, cpu_count
from prody import parsePDBHeader, parsePDB
from AtomCompData import AtomCompData
import sys
import getopt


# def calculate_distance_between_aminoacids(amino1, amino2):
def calculate_distance_between_aminoacids(comparison):
    amino1 = comparison[0]
    amino2 = comparison[1]

    atom_distance = []
    MAX_THRESHOLD = 10

    for res1 in amino1:
        for res2 in amino2:
            # print(res1, res2)
            coords1 = res1.getCoords()
            coords2 = res2.getCoords()
            distance = 0
            for i in range(len(coords1)):
                distance += math.pow(coords2[i] - coords1[i], 2)
            distance = math.sqrt(distance)
            if distance > MAX_THRESHOLD:
                return atom_distance
            elif distance <= 4:

                comparison = AtomCompData()

                comparison.atom1 = res1.getElement()
                comparison.chain1 = res1.getChid()
                comparison.resnum1 = int(res1.getResnum())
                comparison.resname1 = res1.getResname()

                comparison.atom2 = res2.getElement()
                comparison.chain2 = res2.getChid()
                comparison.resnum2 = int(res2.getResnum())
                comparison.resname2 = res2.getResname()

                comparison.distance = distance
                comparison.type_of_interaction = ti.type_of_interaction(comparison)

                debug.print_message(f"Contact found {comparison}")
                atom_distance.append(comparison)

    return atom_distance


class NetworkAnalysis:

    def __init__(self, source_folder, _chains1, _chains2):
        self.pdb_files = []
        self.directory_path = pathlib.Path(source_folder)
        self.interaction_threshold = 4.0

        self.chains1 = _chains1
        self.chains2 = _chains2

        self.get_pdb_files()
        pass

    def get_pdb_files(self):
        list_of_files = list(self.directory_path.glob("*.pdb"))
        debug.print_message(f"Number of files found: {len(list_of_files)}")
        self.pdb_files = list_of_files[:]
        self.save_list_of_pdbs()

    def save_list_of_pdbs(self):
        list_of_pdbs = []
        index = 1
        for pdb in self.pdb_files:
            dic_of_pdb = {}
            dic_of_pdb["index"] = index
            dic_of_pdb["pdb"] = pdb.stem
            dic_of_pdb["path"] = str(pdb)
            list_of_pdbs.append(dic_of_pdb)
            index += 1

    def calculate_interactions(self, pdb_file, chain1, chain2):
        debug.print_message("calculate interactions")
        jobs = []
        for amino1 in pdb_file[chain1]:
            for amino2 in pdb_file[chain2]:
                #  vector_norm = np.linalg.norm(res1.getCoords()-res2.getCoords())
                # self.calculate_distance_between_aminoacids(amino1, amino2)
                jobs.append([amino1, amino2])

        pool = Pool(processes=(cpu_count() - 1))
        results = pool.map_async(calculate_distance_between_aminoacids, jobs)
        results = results.get()

        flat_results = []
        interactions_dic = []
        for x in results:
            for y in x:
                y.pdb_name = pdb_file.getTitle()
                flat_results.append(y)
                interactions_dic.append(y.to_dictionary())

                # debug.print_message(f"adding to the contact list {y}")
        #db.add_record(interactions_dic[0])

        return flat_results
        #print(flat_results, len(flat_results))

    def run_experiment(self, pdb_path):
        pdb = parsePDB(pdb_path)

        debug.print_message(f"Parsing {pdb_path}")
        contacts = []
        for chain1 in self.chains1:
            for chain2 in self.chains2:
                contacts += self.calculate_interactions(pdb, chain1, chain2)
        print(len(contacts))
        return contacts

    def pdb_get_sequences(self, pdb):
        dict_sequences = []
        for chain in self.chains1:
            dict_sequences.append(self.pdb_get_sequence(pdb, chain))

        for chain in self.chains2:
            dict_sequences.append(self.pdb_get_sequence(pdb, chain))

        return dict_sequences

    def pdb_get_sequence(self,pdb, chain):
        seq_dic = {}
        seq_dic["seq"] = pdb[chain].getSequence()
        seq_dic["chain"] = chain
        seq_dic["pdb"] = pdb.getTitle()
        return seq_dic
        #for amino1 in pdb[chain]:


class InteractionNetwork:

    def generate_interaction_network(self, contacts):
        nodes = bn.get_nodes(contacts)
        edges, g = bn.get_edges(contacts, nodes)
        print(edges, len(edges))
        self.plot_network(g)
        return g

    def plot_network(self, g):
        node_size = [(d * 1000) for v, d in g.degree()]

        fig, ax = plt.subplots(figsize=(15, 9))
        ax.axis('off')
        plot_options = {"with_labels": True, "width": 0.5, "alpha": 0.8}
        #pos = nx.spring_layout(g, iterations=15, seed=1969)
        pos = nx.spring_layout(g, iterations=15, seed=2022)
        nx.draw_networkx(g, pos=pos, node_size=node_size, ax=ax, **plot_options)

    def plot_interaction_network(self, pdb_name):
        path_pdb = "/Users/dante/Dropbox (Scripps Research)/wardlab/roxeta_antibody_design_template/" \
                   "design_409_wt2assign/pdb_output"

        pdb_file = f"{path_pdb}/{pdb_name}.pdb"
        netobj = NetworkAnalysis(pdb_file, ['A'], ['H', 'L'])
        contacts = netobj.run_experiment(pdb_file)
        g = self.generate_interaction_network(contacts)
        self.plot_network(g)


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
    if "input_path" in parameters:
        pdb_file = f"{parameters['input_path']}/{parameters['PDB']}"
    else:
        pdb_file = parameters['PDB']

    #pdb_file = "/home/dante/PDB_antibody/pdb5xs7.pdb"
    pdb_header = parsePDBHeader(pdb_file)
    starttime = time.time()

    if len(sys.argv) > 0:
        #pdb_header = sys.argv[1]
        if pdb_header["identifier"] == "XXXX":
            pdb_header["identifier"] = Path(pdb_file).stem

        db_interactions = dbi.Db_interactions()
        interactions = db_interactions.get_interactions(pdb_header["identifier"])

        if len(interactions) == 0:
            netobj = NetworkAnalysis(pdb_file, parameters["antigen"], parameters["antibody"])
            contacts = netobj.run_experiment(pdb_file)
            db_interactions.upload_interactions(contacts)
            print(contacts)
        else:
            print(interactions)

    endtime = time.time()
    debug.print_info(f"Time taken {endtime - starttime} seconds")
