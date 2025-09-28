from fastapi import FastAPI

app = FastAPI(
    title="Wasl API Server",
    description="The main application server for creating and linking knowledge blocks.",
    version="0.1.0",
)

@app.get("/", tags=["Health Check"])
async def root():
    """
    Simple health check endpoint to confirm the server is running.
    """
    return {"status": "ok", "message": "Welcome to the Wasl API Server"}

# Here is where we would include routers from the /api directory
# from .api import blocks
# app.include_router(blocks.router, prefix="/api/v1")
