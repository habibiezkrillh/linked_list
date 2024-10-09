/// Class to represent a node in the linked list.
class Node {
  int data; // To store the data value
  Node? next; // Pointer to the next node

  /// Constructor to create a new node with given data.
  Node(this.data);
}

/// Class to represent the Linked List itself.
class LinkedList {
  Node? head; // Head node of the linked list

  /// Method to insert a new node at the end of the linked list.
  void insert(int data) {
    Node newNode = Node(data); // Create a new node
    if (head == null) {
      // If the list is empty, set the new node as the head
      head = newNode;
    } else {
      Node? current = head;
      while (current?.next != null) {
        current = current?.next; // Traverse to the last node
      }
      current?.next = newNode; // Set the new node as the next of the last node
    }
  }

  /// Method to display all nodes in the linked list.
  void display() {
    Node? current = head;
    if (current == null) {
      print("The linked list is empty.");
      return;
    }
    while (current != null) {
      print(current.data); // Print data of the current node
      current = current.next; // Move to the next node
    }
  }

  /// Method to search for a specific data value in the linked list.
  bool search(int data) {
    Node? current = head;
    while (current != null) {
      if (current.data == data) {
        return true; // Data found
      }
      current = current.next;
    }
    return false; // Data not found
  }

  /// Method to delete a node with a specific data value.
  void delete(int data) {
    if (head == null) {
      print("The linked list is empty.");
      return;
    }

    // If the node to be deleted is the head node
    if (head?.data == data) {
      head = head?.next; // Change the head to the next node
      return;
    }

    Node? current = head;
    while (current?.next != null) {
      if (current?.next?.data == data) {
        current?.next = current.next?.next; // Skip the node to delete it
        return;
      }
      current = current?.next;
    }

    print("Node with data $data not found.");
  }
}

void main() {
  LinkedList list = LinkedList();

  // Insert some nodes
  list.insert(10);
  list.insert(20);
  list.insert(30);
  list.insert(40);

  // Display the list
  print("Linked List:");
  list.display();

  // Search for a node
  print("\nSearching for 30: ${list.search(30)}"); // Should return true
  print("Searching for 50: ${list.search(50)}"); // Should return false

  // Delete a node
  print("\nDeleting 20:");
  list.delete(20);
  list.display();
}
