def reconstruct_queue(people)
  people.sort_by!{ |height, k| [-height, k] }
  people.each_with_object([]) { |p, array| array.insert(p[1], p) }
end
