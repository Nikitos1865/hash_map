require './node'

class Linked_List 

    attr_accessor :head

    def initialize(head = nil)
        @head = head
    end 

    def append(value)
        new_node = Node.new(value)
        if @head == nil
          @head = new_node
        else
          tail.next_node = new_node
        end 
    end

    def at(index)
        count = 0 
        current = @head
        if index == 0 
            current
        elsif index <= self.size
            while count < index
                count += 1
                current = current.next_node
            end 
        else 
            return nil
        end 
        current
    end 


    def find(val)
        current = @head
        index = 0 
        while current != nil 
            if current.value == val 
                return self.at(index)
            end 
            index += 1
            current = current.next_node
        end 
        puts "not found"
    end 

    def to_s
        if @head == nil 
            puts "Empty Linked List"
        else 
            string = String.new()
            current = @head 
            loop do
                string << "#{current.value} -> "
                current = current.next_node
                if current.next_node.nil? 
                    string << "#{current.value} -> nil "
                    break
                end
            end
            puts string
        end 
    end

    def contains?(val)
        found = false 
        current = @head 
        while current != nil
            if current.value == val
                found = true
            end 
            current = current.next_node
        end 
        found
    end 

    def prepend(value)
        new_node = Node.new(value,@head)
        @head = new_node
    end 

    def size
        count = 0
        if @head == nil 
            return count
        else 
            current = @head
            count += 1
            loop do 
                count += 1
                current = current.next_node
            break if 
            current.next_node.nil?  
            end 
        end 
        count
    end

    def tail 
        current = @head 
        while current.next_node != nil 
            current = current.next_node
        end
        current
    end 

    def head 
        @head
    end 

    def remove_at(index)
        begin
            if index == 0
                delete(@head)
            else 
            to_remove = self.at(index)
            self.at(index-1).next_node = self.at(index+1)
            delete(to_remove)
            end 
        rescue 
            "Out of bounds probably"
        end 
    end 

    def insert_at(val, index)
        new_node = Node.new(val, nil)
        if self.at(index) == nil 
            tail.next_node = new_node
        elsif index == 0
            self.prepend(val)
        else 
            new_node.next_node = self.at(index)
            self.at(index - 1).next_node = new_node
        end 
    end 

    def replace(val, index)
        new_node = Node.new(val, nil)
        if self.at(index) == nil 
            tail.next_node = new_node
        else 
            new_node.next_node = self.at(index+1)
            self.at(index - 1).next_node = new_node
        end 
    end 


end

link = Linked_List.new

link2 = Linked_List.new()

link3 = Linked_List.new

link.append("one")

link.append('tothe')

link.append("two")

link.append("totha")

link.append('three')

link.append('tothee')

link.append("four")

link.prepend("babo")

link2.append("bibo")
link2.append("bibo")
link2.append("bibo")
link2.append("bibo")
link2.append("bibo")


link3.append("bajo")
link3.append("jajo")
link3.append("bajo")
link3.append("jajo")
link3.insert_at("kurwa mac", 3)
link3.insert_at('ja ciebe', 0)






