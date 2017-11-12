# Linked Lists

One of the most basic and fundamental data structures in Computer Science is the linked list. This project's objective is for me to implement such a data structure in Ruby.

When building the methods I've tried to stay true to the nature of the data structure. I could've added a class variable to keep track of the size of the list. And I could've assigned a class variable to keep track of the tail of the list. But on purpose I haven't done that.

Also, I've learnt about the importance of speed when studying algorithms. I've tried to keep my methods as fast as possible. An example of that is that I rarely iterate the list more than once in each method. An exception is #insert_at and #delete_at, which use the #size method. I got lazy.

## Assignment
(Copy&pasted from The Odin Project's website)

#### You will need two classes:

1. LinkedList class, which will represent the full list.
2. Node class, containing a #value method and a link to the #next_node, set both as nil by default.

##### Build the following methods in your linked list class:

* **#append** adds a new node to the end of the list
* **#prepend** adds a new node to the start of the list
* **#size** returns the total number of nodes in the list
* **#head** returns the first node in the list
* **#tail** returns the last node in the list
* **#at(index)** returns the node at the given index
* **#pop** removes the last element from the list
* **#contains?** returns true if the passed in value is in the list and otherwise returns false.
* **#find(data)** returns the index of the node containing data, or nil if not found.
* **#to_s** represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( data ) -> ( data ) -> ( data ) -> nil
* **#insert_at(index)** that inserts the node at the given index
* **#remove_at(index)** that removes the node at the given index. (You will need to update the links of your nodes in the list when you remove a node.)