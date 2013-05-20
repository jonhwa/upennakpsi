Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :pledge_classes do
    resources :pledge_classes, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :pledge_classes, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :pledge_classes, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
