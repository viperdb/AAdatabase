from kpax_kmulti_parse import KmultiParse
from Db_interactions import Db_interactions
import collections
import json

class AnnotateAlignmentEpitopes:

    def __init__(self):
        self.kmulti_file = ""
        self.kalign_data = ""
        self.interactions_data = []
        self.conservation = []
        self.gaps = []
        self.consensus = []
        self.aligned_residues = []
        pass

    def load_alignment(self):
        kmulti = KmultiParse()
        kmulti.load_file(self.kmulti_file)
        self.kalign_data = kmulti.parse()
        #print(json.dumps(self.kalign_data.align))

    def load_epitopes(self, pdb, chain):
        self.interactions_data.append( Db_interactions().get_antigen_interactions_by_chain(pdb, chain))
        #print(pdb, chain,len(self.interactions_data[-1] ))
        pass

    def annotate_alignment(self):
        self.load_alignment()
        for i,pdb in enumerate(self.kalign_data.pdbs):
            chains = self.kalign_data.get_chains(i)
            for chain in chains:
                self.load_epitopes(pdb['pdb_id'], chain)

            for epitope in  self.interactions_data[i]:
                #for epitope in chain:
                self.kalign_data.set_annotation(epitope, i)
        return self.kalign_data

    def calculate_seq_conservation_consensus(self):
        for alignment in self.kalign_data.align:
            gap = 0
            aminoacids = []
            a_res = 0
            for seq in alignment:
                if seq["r_name"] == "-":
                    gap += 1
                else:
                    aminoacids.append(seq["r_name"])
                    a_res += 1
            self.aligned_residues.append(a_res)
            self.gaps.append(gap)
            self.consensus.append(dict(collections.Counter(aminoacids)))
        pass
if __name__ == "__main__":
    #path_file = "/home/dante/Julianne/antigens/kpax_results/4FQI_B/4FQI_B.kmulti"
    path_file = "/home/dante/Julianne/antigens/kpax_results/5K9Q_B/5K9Q_B.kmulti"
    kmulti = AnnotateAlignmentEpitopes()
    kmulti.kmulti_file = path_file
    annotated_a = kmulti.annotate_alignment()
    #print(json.dumps(annotated_a))
    #kmulti.calculate_seq_conservation_consensus()
