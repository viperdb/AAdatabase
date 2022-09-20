import Atom_prop_def as atmp
from AtomCompData import AtomCompData

distance = 0
atom_type_1 = 3
amino_name_1 = 5
atom_type_2 = 8
amino_name_2 = 10
interaction = AtomCompData()


def is_non_polar():
    #inter_val = atmp.polar_non_polar[interaction[amino_name_1]][interaction[atom_type_1]]+\
    #atmp.polar_non_polar[interaction[amino_name_2]][interaction[atom_type_2]]
    inter_val = atmp.polar_non_polar[interaction.resname1][interaction.atom1] +\
                atmp.polar_non_polar[interaction.resname2][interaction.atom2]
    if inter_val >= 17:
       return "Hydr-Phbc"
    return "No"


def is_salt_bridge(inter_val):
    if inter_val == 29:
        return "Salt-Bridge"
    return "No"


def is_hydrogen_bound():
    inter_val = atmp.hyd_salt[interaction.resname1][interaction.atom1] + \
                atmp.hyd_salt[interaction.resname2][interaction.atom2]
    if inter_val in atmp.hyd_vals:
        saltb= is_salt_bridge(inter_val)
        if saltb != "No":
            return saltb
        else:
            return "Hydro-Bond"
    return "No"


def type_of_interaction(interaction_p):
    global interaction
    try:
        interaction = interaction_p
        type_of_inter = is_non_polar()
        if type_of_inter != "No":
            return type_of_inter
        type_of_inter = is_hydrogen_bound()
        if type_of_inter != "No":
            return type_of_inter
    except KeyError as e:
        return "None"
    return "Van-der-Waals"


#print(type_of_interaction([2.34, "", "5xs7", "OG", 236, "SER", "A", "5xs7", "OH", 112, "TYR", "H"]))
