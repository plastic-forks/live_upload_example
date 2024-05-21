defmodule DropsWeb.Router do
  use DropsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {DropsWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DropsWeb do
    pipe_through :browser

    live "/", PageLive, :index
    live "/uploader", UploaderLive.Demo, :index
    live "/uploader/start", UploaderLive.Demo, :start
    live "/uploader/done", UploaderLive.Demo, :done
    live "/uploader/brb", UploaderLive.Demo, :continue

    live "/uploads/media-recorder", UploadsLive.MediaRecorder, :index
    live "/croppr", CropprLive, :index

    live "/writers/s3", WriterLive.S3, :index
  end
end
