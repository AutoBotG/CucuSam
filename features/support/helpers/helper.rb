module MyHelper

  def self.prep_cuke_folder(out_dir)
    FileUtils.rm_r(out_dir) unless Dir["#{out_dir}*"].empty?
    Dir.mkdir(out_dir) unless File.exists?(out_dir)
  end

end
World MyHelper