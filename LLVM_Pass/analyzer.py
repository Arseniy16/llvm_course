#!/usr/bin/python3

from matplotlib import pyplot as plt
import numpy as np
import seaborn as sns
from sys import argv

# to create names for each bargraph
def get_label(tuple_names):
    if isinstance(tuple_names, str):
        return tuple_names

    names = tuple_names[0]
    for i in range(1, len(tuple_names)):
        names += "\n" + tuple_names[i]

    return names

def plot_graph(titlename, instructions, filename):
    fig = plt.figure(figsize = (16, 8))
    plt.title(titlename, fontsize=18)
    x = [get_label(i[0]) for i in instructions]
    y = [i[1] for i in instructions]
    my_cmap = plt.get_cmap("plasma")
    rescale = lambda y: (y - np.min(y)) / (np.max(y) - np.min(y))
    plt.bar(x, y, color = my_cmap(rescale(y)))
    plt.xlabel("Name of Instruction", fontsize=15)
    plt.ylabel("Frequency", fontsize=15)
    plt.grid(axis='y')
    plt.tight_layout()
    plt.savefig(filename)

def main():
    if len(argv) < 2:
        print(f"Usage: {argv[0]} <log_file>")
        return

    output = "./"
    log_file = argv[1]
    instructions = []

    with open(log_file, "r") as file:
        instructions = file.readlines()

    # delete spaces for each instruction
    for i in range(0, len(instructions)):
        instructions[i] = instructions[i].strip()

    instr_2 = []
    instr_3 = []
    instr_4 = []
    instr_5 = []

    for i in range(0, len(instructions)):
        if i < len(instructions) - 1:
            instr_2.append((instructions[i], instructions[i + 1]))
        
        if i < len(instructions) - 2:
            instr_3.append((instructions[i], instructions[i + 1], instructions[i + 2]))

        if i < len(instructions) - 3:
            instr_4.append((instructions[i], instructions[i + 1], instructions[i + 2], instructions[i + 3]))

        if i < len(instructions) - 4:
            instr_5.append((instructions[i], instructions[i + 1], instructions[i + 2], instructions[i + 3], instructions[i + 4]))
   
    # create set for instructions
    dict_instr_1 = {obj : instructions.count(obj) for obj in set(instructions)}
    dict_instr_2 = {obj : instr_2.count(obj)      for obj in set(instr_2)     }
    dict_instr_3 = {obj : instr_3.count(obj)      for obj in set(instr_3)     }
    dict_instr_4 = {obj : instr_4.count(obj)      for obj in set(instr_4)     }
    dict_instr_5 = {obj : instr_5.count(obj)      for obj in set(instr_5)     }

    # sort (key, value) for each set of instructions
    sort_instr_1 = sorted(dict_instr_1.items(), key=lambda item: item[1], reverse=True)
    plot_graph("Statistics: One instruction", sort_instr_1[0:10], output + "image_1.png")

    sort_instr_2 = sorted(dict_instr_2.items(), key=lambda item: item[1], reverse=True)
    plot_graph("Statistics: Two instructions", sort_instr_2[0:10], output + "image_2.png")

    sort_instr_3 = sorted(dict_instr_3.items(), key=lambda item: item[1], reverse=True)
    plot_graph("Statistics: Three instructions", sort_instr_3[0:10], output + "image_3.png")

    sort_instr_4 = sorted(dict_instr_4.items(), key=lambda item: item[1], reverse=True)
    plot_graph("Statistics: Four instructions", sort_instr_4[0:10], output + "image_4.png")

    sort_instr_5 = sorted(dict_instr_5.items(), key=lambda item: item[1], reverse=True)
    plot_graph("Statistics: Five instructions", sort_instr_5[0:10], output + "image_5.png")


if __name__ == '__main__':
    main()