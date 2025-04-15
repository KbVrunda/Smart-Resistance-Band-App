import asyncio
import websockets
import random

async def send_fake_force_data(websocket):
    print("Client connected")
    try:
        while True:
            force = str(random.randint(50, 300))  # Simulated force values
            print("Sending:", force)
            await websocket.send(force)
            await asyncio.sleep(0.2)
    except websockets.exceptions.ConnectionClosed:
        print("Client disconnected")

async def main():
    server = await websockets.serve(send_fake_force_data, "localhost", 8765)
    print("WebSocket server running on ws://localhost:8765")
    await server.wait_closed()

asyncio.get_event_loop().run_until_complete(main())
