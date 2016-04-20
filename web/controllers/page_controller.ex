defmodule HelloPhoenix.PageController do
  use HelloPhoenix.Web, :controller

# plug :action
# plug :render when action in [:index]

  def index(conn, params) do
    conn
    #|> put_flash(:info, "Welcome to Phoenix, from flash info!")
    #|> put_flash(:error, "Let's pretend to have an error.")
    #|> put_layout("admin.html")
    |> render "index.html"
    #render conn, "index.text", message: params["message"]
    #redirect conn, to: "/redirect_test"
  end
  
  def redirect_test(conn, _params) do
    text conn, "Redirect!"
  end
  
  def show(conn, %{"id" => id}) do
      html conn, """
     <html>
       <head>
          <title>Passing an Id</title>
       </head>
       <body>
         <p>You sent in id #{id}</p>
       </body>
     </html>
    """
  end
end
