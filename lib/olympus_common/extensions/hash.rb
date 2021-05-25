class ::Hash
    def deep_merge(second)
        merger = proc { |_, v1, v2| Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : Array === v1 && Array === v2 ? v1 | v2 : [:undefined, nil, :nil].include?(v2) ? v1 : v2 }
        merge(second.to_h, &merger)
    end
  
    def compact
        delete_if { |_k, v| v.nil? }
    end
  
    # @param [Hash]
    # @return [Hash]
    def with_defaults(defaults = {})
        merged_hash = defaults.merge(self)
        merged_hash.compact
        merged_hash
    end
end