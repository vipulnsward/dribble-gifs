class DribbbleService

  class <<self
    def is_gif?(path)
      ext = File.extname(URI.parse(path).path)
      ext == ".gif" || ext == ".GIF"
    end


    def get_gifs_for_page(page_no, type)
      if type.present? and ["popular", "debuts"].include?(type)
        method_call = type
      end
      method_call ||= "popular"
      gif_shots = []
      shots = Dribbble::Shot.send method_call.to_sym, {:page => page_no, :per_page => 30}
      shots.each do |shot|
        gif_shots << shot if is_gif?(shot.image_url)
      end
      gif_shots
    end
  end
end