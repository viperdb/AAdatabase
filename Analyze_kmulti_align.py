# ----------------------------------------------------------------
# Created by    : Daniel Montiel
# Created date   : 22/ Nov / 2022
# -----------------------------------------------------------------
"""
    Entry point to get the Kalign and the annotated metadta
    developed to provide epitope conservation
"""

import json
from AnnotateAlignment_epitopes import AnnotateAlignmentEpitopes
import matplotlib.pyplot as plt
import pandas as pd
import sys
import getopt


class AnalyzeKmulti:

    def __init__(self):
        self.annotated_alignment = ""
        self.epitope_conservation = []
        self.epitope_conservation_type_int = []
        self.epitope_index = []
        self.kmulti = ""
        pass

    def load_alignment(self, path_file):

        self.kmulti = AnnotateAlignmentEpitopes()
        self.kmulti.kmulti_file = path_file
        self.annotated_alignment = self.kmulti.annotate_alignment()
        #print(self.annotated_alignment)
        self.kmulti.calculate_seq_conservation_consensus()

    def to_json(self):
        alignment_annotations = {"epitope_conservation": self.epitope_conservation,
                                 "epitope_conservation_type_int": self.epitope_conservation_type_int,
                                 "epitope_index": self.epitope_index}
        return json.dumps(alignment_annotations)

    def calculate_conservation(self):
        for index, a_row in enumerate(self.annotated_alignment.align):
            epitopes = 0
            type_int = {}
            for strucuture in a_row:
                if "t_int" in strucuture:
                    epitopes += 1
                    if strucuture['t_int'] in type_int:
                        type_int[strucuture['t_int']] += 1
                    else:
                        type_int[strucuture['t_int']] = 1
            if epitopes > 0:
                self.epitope_index.append(index)
            self.epitope_conservation.append(epitopes)
            self.epitope_conservation_type_int.append(type_int)

    def print_align_resume(self):
        for index in self.epitope_index:
            print(index)
            frame =pd.DataFrame(self.annotated_alignment.align[index])
            print(frame.head())
            #pprint.pprint(self.annotated_alignment.align[index])
            #for structure in self.annotated_alignment.align[index]:


    def plot_conservation(self):
        plt.bar( range(len(self.epitope_conservation)) , self.epitope_conservation, width=1)
        plt.show()

def arguments_parsing():
    global PDB_path
    OPTIONS = {}
    if len(sys.argv) > 1:
        try:
            opts, args = getopt.getopt(sys.argv[1:], "", ["kmulti=", "get_alignment", "get_annotation"])
        except getopt.GetoptError as err:
            print(f"Parameters error {err}")
            exit(2)
        OPTIONS["alignment"] = False
        OPTIONS["annotation"] = False

        for opt, arg in opts:
            if opt == "--kmulti":
                OPTIONS["kmulti"] = arg
            elif opt == "--get_alignment":
                OPTIONS["alignment"] = True
                PDB_path = arg
            elif opt == "--get_annotation":
                OPTIONS["annotation"] = True

        return OPTIONS
    else:
        print("Parameters missing")
        print(" --kmulti [kpax k align structural alignment file]")
        print(" --get_alignment -> Parameter to retrieve kalign file encoded in json format")
        print(" --get_annotation -> Parameter to retrieve the structural conservation annotation")
        exit(2)
    print("Wait")


if __name__ == "__main__":
    #path_file = "/home/dante/Julianne/antigens/test_cases/4FQI_B/4FQI_B.kmulti"
    path_file = "/home/dante/Julianne/antigens/kpax_results/5K9Q_B/5K9Q_B.kmulti"
    params = arguments_parsing()
    if "kmulti" in params:
        path_file = params["kmulti"]
    obj = AnalyzeKmulti()
    obj.load_alignment(path_file)
    obj.calculate_conservation()
    if params["alignment"]:
        print(str(obj.kmulti.kalign_data))
    else:
        print(obj.to_json())

    #print(obj.to_json())
    #print(str(test))
    #obj.plot_conservation()
    #print("ddd")

