use axum::{extract::ws::WebSocketUpgrade, response::Response, routing::get, Router};
use std::net::SocketAddr;
use tracing::info;

// For now, this is a placeholder. The real handler will be in its own module.
// mod ws_handler; 

async fn websocket_handler(ws: WebSocketUpgrade) -> Response {
    ws.on_upgrade(|socket| async {
        info!("Client connected for real-time sync.");
        // This is where the real logic from ws_handler.rs will go.
        // For now, we just print a message.
        // ws_handler::handle_socket(socket).await;
    })
}

#[tokio::main]
async fn main() {
    // Set up logging
    tracing_subscriber::fmt::init();

    let app = Router::new().route("/ws", get(websocket_handler));
    let addr = SocketAddr::from(([0, 0, 0, 0], 8080));

    info!("Wasl Sync Server listening on {}", addr);

    axum::Server::bind(&addr)
        .serve(app.into_make_service())
        .await
        .unwrap();
}
