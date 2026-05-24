re 'json'

def merge_json_files(file1_path, file2_path)
    return unless File.exist?(file1_path) && File.exist?(file2_path)

      data1 = JSON.parse(File.read(file1_path))
        data2 = JSON.parse(File.read(file2_path))

          data1 = [data1] unless data1.is_a?(Array)
            data2 = [data2] unless data2.is_a?(Array)

              merged_data = data2 + data1

                File.open(file2_path, 'w') do |f|
                      f.write(JSON.pretty_generate(merged_data))
                        end
end
