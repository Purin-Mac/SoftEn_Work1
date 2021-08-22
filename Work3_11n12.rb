class BinaryTree

    include Enumerable  #included Enumerable for all? included? any? 
    attr_accessor :value,:left,:right #set attr_accessor for each node and child 
      
    def initialize( value = nil )  #construcor and default value is nil 
        @value = value  #setting each values and child 
        @left = nil
        @right = nil
    end
     

    def empty?
        return ( self.value == nil ) ? true : false #if first node is empty 
    end
         
    def <<(value) #insert values 
        if @value
            if value < @value #if value less than current node 
                if @left == nil
                    @left = BinaryTree.new() #create new node and assight value 
                    @left.value = value
                else
                    @left << (value)
                    
                end
            elsif value > @value #if value more than current node  
                if @right == nil
                    @right = BinaryTree.new()  #create new node and assight value 
                    @right.value = value
                else
                    @right << (value) #passing to insert right node 
                    
                end
            end
        else
            @value = value
            # puts ("insert")
        end
    end


    def inorderTraversal (node)
        inOrderArray =[]
        if node
            inOrderArray = self.inorderTraversal(node.left)
            inOrderArray.push(node.value)
            inOrderArray = inOrderArray + self.inorderTraversal(node.right)
        end
        return inOrderArray
    end


    def each 
        self.inorderTraversal(self).each{|value| #yield each values in inorder 
            yield value
        }
    end

end


binary_tree = BinaryTree.new
binary_tree << 1
binary_tree << 5
binary_tree << 3
binary_tree << 6
binary_tree << 8
binary_tree.each { |x| puts x }
puts binary_tree.any? {|x| x==1}
puts binary_tree.all? {|x| x==1}
puts binary_tree.include?(1)
puts binary_tree.include?(10)

