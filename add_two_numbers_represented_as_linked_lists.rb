# Add two numbers represented as a linked list.
# Source: LeetCode

# You are given two linked lists representing two non-negative numbers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
#
# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

=begin

Pseudocode
Create result linked list
While there are still nodes in both linked lists
    Add values of current nodes from two lists, plus any carry
    Add new node with sum to end of result list
    Set carry
    Go to next nodes in each list

(At this point at most one of the two lists will have nodes remaining.)

While there are still nodes in first list
    Create new node in result list with value of current node plus any carry
    Set carry
    Go to next node

While there are still nodes in second list
    Create new node in result list with value of current node plus any carry
    Set carry
    Go to next node

=end

=begin

def add_two_numbers(l1, l2)

    result = nil    # linked list holding result
    cur1 = l1       # cursor into first linked list
    cur2 = l2       # cursor into second linked list
    cur_r = nil     # cursor into result list
    carry = 0       # carry from adding two numbers

    # While there are still nodes in both linked lists
    while cur1 != nil && cur2 != nil

        # Add values of current nodes from two lists, plus any carry
        new_val = (cur1.val + cur2.val + carry) % 10
        carry = (cur1.val + cur2.val + carry) / 10

        # Add new node with sum to end of result list
        new_node = ListNode.new(new_val)
        if result == nil    # we're processing the first nodes
            result = cur_r = new_node
        else    # we're past the first nodes
            cur_r.next = new_node
            cur_r = new_node
        end

        cur1 = cur1.next
        cur2 = cur2.next

    end

    # While there are still nodes in first list
    while cur1 != nil

        # Create new node in result list with value of current node plus any carry
        new_val = (cur1.val + carry) % 10
        carry = (cur1.val + carry) / 10
        new_node = ListNode.new(new_val)

        if result == nil    # we're processing the first nodes
            result = cur_r = new_node
        else    # we're past the first nodes
            cur_r.next = new_node
            cur_r = new_node
        end

        cur1 = cur1.next

    end

    # While there are still nodes in first list
    while cur2 != nil

        # Create new node in result list with value of current node plus any carry
        new_val = (cur2.val + carry) % 10
        carry = (cur2.val + carry) / 10
        new_node = ListNode.new(new_val)

        if result == nil    # we're processing the first nodes
            result = cur_r = new_node
        else    # we're past the first nodes
            cur_r.next = new_node
            cur_r = new_node
        end

        cur2 = cur2.next

    end

    # If at the very end we still have a carry, add it
    if carry != 0
        cur_r.next = ListNode.new(carry)
    end


    return result

end

=end

# Refactor
# Eliminate second and third loops by interpreting nil at end of list as 0.
# Eliminate test for first node by using dummy head.

def add_two_numbers(l1, l2)

    cur1 = l1       # cursor into first linked list
    cur2 = l2       # cursor into second linked list
    dummy_result_head = cur_r = ListNode.new(0)     # use a dummy head to avoid if/then test for first node
    carry = 0       # carry from adding two numbers

    # While there are still nodes in either linked list
    while cur1 != nil || cur2 != nil

        # Add values of current nodes from two lists, plus any carry
        val1 = ((cur1 != nil) ? cur1.val : 0)
        val2 = ((cur2 != nil) ? cur2.val : 0)
        sum = val1 + val2 + carry
        new_val = sum % 10
        carry = sum / 10

        # Add new node with sum to end of result list
        cur_r.next = ListNode.new(new_val)
        cur_r = cur_r.next

        cur1 = cur1.next if cur1 != nil
        cur2 = cur2.next if cur2 != nil
        
    end

    # If at the very end we still have a carry, add it
    if carry != 0
        cur_r.next = ListNode.new(carry)
    end

    return dummy_result_head.next

end
