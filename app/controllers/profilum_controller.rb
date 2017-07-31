class ProfilumController < ApplicationController
  # post /profilum/login
  def login
    email = param_from_request(:email)
    api   = ProfilumApi.new(email)

    render plain: api.token
  end
end
