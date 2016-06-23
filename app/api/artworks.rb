module API
  class Artworks < Grape::API
    # get :ping do
    #   { data: "pong" }
    # end

    resource :artworks do
      params do
        requires :fea_id, :type =>String, :desc => "feature id"
      end
      route_param :fea_id do
        get do
          m = Hashie::Mash.new
          m.code = 0
          m.message = "success"
          md = []
          begin
            Artwork.where(feature_id: params[:fea_id]).each do |artwork|
              md << artwork
            end
          rescue => e
            m.code = 1
            m.message = "#{e}"
          end
          m.data = md
          m

        end
      end

    end

  end

end
