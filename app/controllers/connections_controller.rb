class ConnectionsController < ApplicationController
  def create
    @connection = Connection.new
    @connection.password = (connection_params_password)
    @connection.used = false
    @connection.group = (Group.find_by name: (connection_params_group.values))
    @group = @connection.group
    @connection.user = current_user
    if @connection.save
      redirect_to current_user
    end
  end

  def new
    @connection = Connection.new
  end

  def show
    @group = Group.find_by id: (params[:group_id])
  end

  def update

  end

  def connection_params_password
    #@group = Group.find_by name: params[:connection][:group]
    params.require(:connection).permit(:password)
  end

  def connection_params_group
    #@group = Group.find_by name: params[:connection][:group]
    params.require(:connection).permit(:group)
  end
end
