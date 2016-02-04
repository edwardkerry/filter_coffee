require 'net/http'

class WorkspacesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @workspaces = Workspace.all
  end

  def new
    @workspace = Workspace.new

  end

  def create
    @workspace = Workspace.new(name: workspace_params[:name].split(",")[0], address: workspace_params[:name].split(",").unshift)

    @client = GooglePlaces::Client.new('AIzaSyAkk0WzkJl4oPNEYm6YbpXasQHRfHB3zSk')
    @spot = @client.spot("#{@workspace.latitude},#{@workspace.longitude}")

      if @workspace.save
        get_place_id(@workspace)





    # url = URI.parse("https://maps.googleapis.com/maps/api/place/details/json?name=#{workspace_params[:name]}&types=establishment&key=AIzaSyAkk0WzkJl4oPNEYm6YbpXasQHRfHB3zSk")
    # http = Net::HTTP.new(url.host, url.port)
    # http.use_ssl = true
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production
    # request = Net::HTTP::Get.new(url.request_uri)
    # res = http.request(request)
    # puts res.body


      redirect_to "/workspaces"
    else
      render "new"
    end
  end

  def show
    @workspace = Workspace.find(params[:id])
  end

  def edit
    @workspace = Workspace.find(params[:id])
  end

  def update
    @workspace = Workspace.find(params[:id])
    @workspace.update(workspace_params)
    flash[:notice] = "Edit successful"
    redirect_to workspace_path(@workspace)
  end

  def destroy
    @workspace = Workspace.find(params[:id])
    @workspace.destroy
    flash[:notice] = "Delete successful"
    redirect_to "/workspaces"
  end

  def workspace_params
    params.require(:workspace).permit(:name, :address, :latitude, :longitude)
  end

  def get_place_id(workspace)
    url = URI.parse("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{workspace.latitude},#{workspace.longitude}&rankby=distance&name=#{workspace.name}&types=establishment&key=AIzaSyAkk0WzkJl4oPNEYm6YbpXasQHRfHB3zSk")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production
    request = Net::HTTP::Get.new(url.request_uri)
    res = http.request(request)
    puts res.body
  end
end
