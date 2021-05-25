# frozen_string_literal: true

require 'yaml_extend'

module OlympusCommon
    class YamlParser
        class << self
            def load(absolute_path)
                root = YAML.ext_load_file(absolute_path)
                load_nested(root, File.dirname(absolute_path))
            end
    
            private
    
            def load_nested(hash, base_path)
                hash.each do |k, v|
                    if v.is_a?(Hash)
                        include_prop = v[ext_load_key]
                        unless include_prop.nil?
                            to_include = []
                            to_include.push(include_prop) if include_prop.is_a?(String)
                            to_include.concat(include_prop) if include_prop.is_a?(Array)
    
                            v.delete(ext_load_key)
    
                            to_merge = {}
                            to_include.each do |path|
                                to_merge = to_merge.deep_merge(load("#{base_path}/#{path}"))
                            end
    
                            v = to_merge.deep_merge(v)
                        end
                
                        hash[k] = load_nested(v, base_path)
                    end
                end
                hash
            end
    
            def ext_load_key
                YAML.class_variable_get(:@@ext_load_key)
            end 
        end
    end
end
