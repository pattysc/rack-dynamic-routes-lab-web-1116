# Your application should only accept the /items/<ITEM NAME> route. Everything else should 404
# If a user requests /items/<Item Name> it should return the price of that item
# IF a user requests an item that you don't have, then return a 400 and an error message

class Application
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new

    if request.path.match(/items/)
      groceryitem = request.path.split("/items/").last
      gi = Item.find(groceryitem)

      if gi
        response.write "#{gi.price}"
      else
        response.write "Item not found"
        response.status = 400
      end
    else
      response.write "Route not found"
      response.status = 404
    end
    response.finish
  end
end
