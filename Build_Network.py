import networkx as nx
import netcomp as nc
import pandas
import Debug_Control as debug
from AtomCompData import AtomCompData

nodeCount = [];

def is_in_array(nodeName, arrData):
    for elm in arrData:
        if nodeName == elm['label']:
            #debug.print_message(f"found {nodeName}")
            return True
    return False


def search_node(nodeName, arrData):
    for elm in arrData:
        if nodeName == elm['label']:
            return elm
    return []


def get_nodes(contacts):
    nodes = []
    nodesCount = 1
    for i, contact in enumerate(contacts):
        debug.print_message(f"contact {contact}")
        if not is_in_array(contact.get_comp_name(1), nodes):
            nodes.append({"id": nodesCount, "value": 5, "group": 1, "label": contact.get_comp_name(1),
                          "typeProt": "Antigen", "pchain": contact.chain1, "pnumber": contact.resnum1})
            debug.print_message(f"Adding node {contact.get_comp_name(1)}")
            nodeCount.append(0);
            nodesCount += 1
        if not is_in_array(contact.get_comp_name(2), nodes):
            nodes.append({"id": nodesCount, "value": 5, "group": 2, "label": contact.get_comp_name(2),
                          "typeProt": "Antibody", "pchain": contact.chain2, "pnumber": contact.resnum2})
            debug.print_message(f"Adding node {contact.get_comp_name(2)}")
            nodeCount.append(0);
            nodesCount += 1

    debug.print_message(f"Number of nodes {nodesCount}")
    dataframe = pandas.DataFrame(nodes)
    return dataframe.sort_values(by=["pchain", "pnumber"]).to_dict("records")


def assemble_edge_title(comp):
    return "({}) {} {}-{}".format(comp.distance, comp.type_of_interaction, comp.atom1, comp.atom2)


def edge_thignest(value, type_of_int):
    val = 5 - value + nodeScore(type_of_int)
    return round(val, 1)


def nodeScore(type_of_inter):
    if type_of_inter == "Salt-Bridge":
        return 4
    elif type_of_inter == "Hydro-Bond":
        return 3
    elif type_of_inter == "Hydr-Phbc":
        return 2
    else:
        return 1


def get_edges(contacts, nodes):
    edges = []
    G = nx.Graph()
    for i, contact in enumerate(contacts):
        i_from = search_node(contact.get_comp_name(1), nodes)
        i_to = search_node(contact.get_comp_name(2), nodes)
        #if contact.type_of_interaction != "Van-der-Waals" and contact.type_of_interaction != "None":
        if contact.type_of_interaction != "None":
            debug.print_message(f"adding {contact.type_of_interaction} {i_from['id']} to {i_to['id']}")
            edges.append({"from": i_from["id"], "to": i_to["id"],
                          "value": edge_thignest(contact.distance, contact.type_of_interaction),
                          "title": assemble_edge_title(contact)})
            G.add_edge(i_from["label"][:], i_to["label"][:],
                       weight=edge_thignest(contact.distance, contact.type_of_interaction))
            nodeCount[i_from["id"]-1] += nodeScore(contact.type_of_interaction)
            nodeCount[i_to["id"] - 1] += nodeScore(contact.type_of_interaction)
        elif contact.type_of_interaction != "None":
            debug.print_message(f"adding {contact.type_of_interaction} {i_from['id']} to {i_to['id']}")
            if not link_exist(edges, i_from, i_to):
                edges.append({"from": i_from["id"], "to": i_to["id"],
                              "value": edge_thignest(contact.distance, contact.type_of_interaction),
                              "title": assemble_edge_title(contact)})
                G.add_edge(i_from["label"][:], i_to["label"][:],
                           weight=edge_thignest(contact.distance, contact.type_of_interaction))
                nodeCount[i_from["id"] - 1] += 1
                nodeCount[i_to["id"] - 1] += 1

    return edges, G


def compare_networks(G1, G2):
    A1, A2 = [nx.adjacency_matrix(G) for G in [G1, G2]]
    distance = nc.deltacon0(A1, A2)
    return distance


def link_exist(edges, i_from, i_to):
    for edge in edges:
        if edge["from"] == i_from["id"] and edge["to"] == i_to["id"]:
            return True
    return False


def update_node_size(nodes):
    for node in nodes:
        node["value"] = 1+nodeCount[node["id"]-1]
    return nodes
