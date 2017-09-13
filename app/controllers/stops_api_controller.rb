require 'cassandra'
class StopsApiController < ApplicationController

  def search_ori
  	@ori = params[:ori]
    results = search_database(@ori)
    if results.present?
      extract_stop_data
      render :send_request, status: :sent_rquest
    else
       render json: {status: 400, message: "Failed"}
    end
  end
  
  def cassandra_connect 
    cluster = Cassandra.cluster(hosts: "ec2-13-58-26-103.us-east-2.compute.amazonaws.com")
    session  = cluster.connect('ab953')  
  end
  
  def search_database(ori)
    @ori = ori
    session = cassandra_connect
    info = session.execute("SELECT * FROM stops_by_ori_reason where ori='#{@ori}'").execution_info
  end
 
  def data_validation
	render json: {success: true}
  end

  def self.perform
    puts 'I like to sleep'
    sleep 2
  end

  def self.queue
    :sloth
  end

end
