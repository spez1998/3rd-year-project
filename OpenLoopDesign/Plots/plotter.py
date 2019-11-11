import matplotlib.pyplot as mp
import csv

x = []
y = []

with open('example.csv','r') as csvfile:
    plot = csv.reader(csvfile, delimiter=',')
    for row in plot:
        x.append(int(row[0]))
        y.append(int(row[0]))
        
