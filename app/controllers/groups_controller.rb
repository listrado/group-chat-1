class GroupsController < ApplicationController
  def index
    connections = current_user.connections.all
    @groups = []
    connections.each do |connection|
      @groups.push(connection.group)
    end
    connections = Connection.where.not(user: current_user)
    @other_groups = []
    connections.each do |connection|
      unless @other_groups.include?(connection.group)
        @other_groups.push(connection.group)
      end
    end

  def show
    @group = Group.find(params[:id])
    @message = Message.new
  end

  def refresh
    @group = Group.find(params[:group_id])
  end

  end
end
