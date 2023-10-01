import tkinter as tk
from tkinter import *

def prepareText(file):
	lines = file.readlines()
	vars  = []
	for index in range(len(lines)):
		if not "#" in lines[index] and not lines[index].isspace():
			vars.append(lines[index])
	return vars

def prepareNames(arr):
	namearr = []
	for line in arr:
		namearr.append(line[0:line.find("=")])
	return namearr		

def prepareValues(arr):
	valuearr = []
	for line in arr:
		valuearr.append(line[line.find("=")+1:])
	return valuearr

class App:
	
	def __init__(self):
		self.nameboxes = []
		self.valueboxes = []
		self.buttons = []
		self.file = None
		self.frame = tk.Tk()
		self.frame.title("ConfigurationEditor")
		self.frame.geometry("800x600")
		self.frame.resizable(False,False)
	
	def createBoxes(self):
		textlines = prepareText(self.file)
		namelines = prepareNames(textlines)
		valuelines = prepareValues(textlines)
		rowcount = 0
		self.cleanWindow()
		for line in namelines:
			T = tk.Text(self.frame,height=1,width=47)
			T.insert(tk.INSERT, line)
			self.nameboxes.append(T)
			T.grid(column=0, row=rowcount, sticky=W)
			rowcount = rowcount+1
		rowcount = 0
		for line in valuelines:
			T = tk.Text(self.frame,height=1,width=40)
			T.insert(tk.INSERT, line)
			self.valueboxes.append(T)
			T.grid(column=1, row=rowcount, sticky=E)
			rowcount = rowcount+1
		for row in range(rowcount):
			DeleteButton = tk.Button(self.frame,text="Delete",command=lambda: self.deleteTextBox(row))
			self.buttons.append(DeleteButton)
			DeleteButton.grid(column=2, row=row, sticky=E)

	def saveFile(self):
		pointer = 0
		self.file = open(self.file.name, "w")
		while (pointer < len(self.nameboxes)):
			fullstr = self.nameboxes[pointer].get("1.0","end-1c")+"="+self.valueboxes[pointer].get("1.0","end-1c")
			self.file.write(fullstr.rstrip("\n")+"\n")	
			pointer = pointer+1
		self.file.flush()
	
	def openBox86File(self):
		self.file = open("/sdcard/androBox/box86opts","r")
		self.createBoxes()
	
	def openBox64File(self):
		self.file = open("/sdcard/androBox/box64opts","r")
		self.createBoxes()
	
	def openUserVarsFile(self):
                self.file = open("/sdcard/androBox/uservars","r")
                self.createBoxes()

	def addToFile(self):
		pointer = len(self.nameboxes)
		T = tk.Text(self.frame,height=1,width=47)
		T.insert(tk.INSERT, "Insert variable name here")
		self.nameboxes.append(T)
		T.grid(column=0, row=pointer, sticky=W)
		T = tk.Text(self.frame,height=1,width=40)
		T.insert(tk.INSERT, "Insert variable value here")
		self.valueboxes.append(T)
		T.grid(column=1, row=pointer, sticky=E)
		DeleteButton = tk.Button(self.frame,text="Delete",command=lambda: self.deleteTextBox(pointer))
		self.buttons.append(DeleteButton)
		DeleteButton.grid(column=2, row=pointer, sticky=E)
		
		

	def createMenu(self):
		self.menu = tk.Menu(self.frame)
		filemenu = tk.Menu(self.menu,tearoff=0)
		filemenu.add_command(label="Box86",command=self.openBox86File)
		filemenu.add_command(label="Box64",command=self.openBox64File)
		filemenu.add_command(label="UserEnvironment",command=self.openUserVarsFile)
		self.menu.add_cascade(label="Select",menu=filemenu)
		self.menu.add_command(label="Save",command=self.saveFile)
		self.menu.add_command(label="Add",command=self.addToFile)
		self.frame.config(menu=self.menu)
	
	
	def cleanWindow(self):
		for textbox in self.nameboxes:
			textbox.destroy()
		for textbox in self.valueboxes:
			textbox.destroy()
		for button in self.buttons:
			button.destroy()
		self.nameboxes = []
		self.valueboxes = []
		self.buttons = []

	def deleteTextBox(self,position):
		self.nameboxes[position].destroy()
		self.valueboxes[position].destroy()
		self.buttons[position].destroy()
		del self.nameboxes[position]
		del self.valueboxes[position]
		del self.buttons[position]
	
	def run(self):
		self.createMenu()
		self.frame.mainloop()

a = App()
a.run()
