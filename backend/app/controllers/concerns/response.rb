module Response
  def json_response(object, serializer = nil, status = :ok)
    if serializer.nil?
      render json: object, status: status
    else
      render json: object, status: status, each_serializer: serializer.constantize
    end
  end
end
