class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def letsencrypt
  	render plain: 'RkwKcLq_gG43O6bxT13FsoVbHXbc3rXwDq2X8PoOuK0.ESaAZOskl9QArHf80V5TrA1RDOhFoB-mW5g0q-bm18M'
  end
end
