module API
  class Features < Grape::API

    get :rec_features do
      # { data: "pong" }
      Feature.where("is_rec = True").order("rec_date ASC").limit(10)
    end

    get :rank_feature do
      ranks = FeatureRank.all
      fea_ranks = Array.new
      ranks.each do |item|
        fea_ranks << Feature.where("identify = ?", item.feature_identify).first
      end
      return fea_ranks
    end
    # get :ping do
    #   { data: "pong" }
    # end
    resource :features do
      params do
        requires :page, :type =>Integer, :desc => "page"
        requires :size, :type =>Integer, :desc => "size"
      end

      get do
        m = Hashie::Mash.new
        m.code = 0
        m.message = "success"
        md = []
        begin
          Feature.order(post_date: :desc).page(params[:page]).per(params[:size]).each do |feature|
            md << feature
          end
        rescue => e
          m.code = 1
          m.message = "#{e}"
        end

        m.data = md

        m
        # m.to_json

      end

    end



  end

end
