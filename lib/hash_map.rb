require './linked_list'
require './node'

class Hashmap 

    attr_reader :size

    INIT32  = 0x811c9dc5
    PRIME32 = 0x01000193
    MOD32   = 2 ** 32
    LOAD = 0.75

    def initialize(number = 32)
        @size = number
        @buckets = Array.new(number)
        end 

    #raise IndexError if index.negative? || index >= @buckets.length

    #hash method FNV1 to minimize collisions

    def hash(data)
        hash = INIT32
    
        data.bytes.each do |byte|
            hash = (hash * PRIME32) % MOD32
            hash = hash ^ byte
        end
        hash % @size
    end
     

    def set(key, value)
        if self.length >= LOAD*@size
            extend_map
        end 
        index = hash(key)
        raise IndexError if index.negative? || index >= @buckets.length
        @buckets[index] = [key, value]
    end 

    def extend_map 
        new_array = []
        new_array = Array.new(@size*2)
        p new_array
        entries.each {|entry| new_array[hash(entry[0])] = [entry[0], entry[1]]}
        @buckets = new_array 
    end 

    def get(key)
        index = hash(key)
        raise IndexError if index.negative? || index >= @buckets.length
        @buckets[index]
    end 

    def length
        count = 0 
        @buckets.each do |buck|
            if buck != nil
                count+=1
            end
        end 
        count 
    end 

    def has?(key)
        if @buckets[hash(key)] != nil
            true
        else false
        end 
    end 

    def clear
        @buckets.map! {|buck| buck = nil}
    end 

    def remove(key)
        @buckets[hash(key)] = nil
    end 

    def keys
        arr = []
        @buckets.each {|entry| arr << entry[0]  if entry!= nil } 
        arr
    end 

    def values
        arr = []
        keys.each {|key| arr << get(key)[1]}
        arr
    end 

    def entries
        arr = []
        keys.each {|key| arr << [get(key)[0],get(key)[1]]}
        arr 
    end 




end 


hashmap = Hashmap.new(8)

link = Linked_List.new

link2 = Linked_List.new

link3 = Linked_List.new

link4 = Linked_List.new
 




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


hashmap.set('one', 1)
hashmap.set('two', 2)
hashmap.set('gazeebo', 3)
hashmap.set("four", 4)
hashmap.set("umbilical", 6)
hashmap.set("gigh", 7)
hashmap.set("seven", 5)

hashmap.get('link3').to_s

p hashmap.has?('link2')
p hashmap.has?("babibo")

p hashmap.length > 0.75*hashmap.size

p hashmap










