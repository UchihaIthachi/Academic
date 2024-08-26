import random

class CSMA_CD:
    def __init__(self, station_id, collision_probability=0.2, max_attempts=16):
        self.station_id = station_id
        self.collision_probability = collision_probability
        self.max_attempts = max_attempts
        self.attempts = 0

    def transmit(self, data):
        print(f"Station {self.station_id} starts transmitting...")
        
        if random.random() < self.collision_probability:
            print(f"Collision detected by station {self.station_id}")
            return False
        
        print(f"Station {self.station_id} transmits successfully after {SLOT_TIME_BITS} bits")
        return True

    def backoff(self):
        k = min(self.attempts, 10)
        delay = random.randint(0, 2 ** k - 1) * SLOT_TIME_BITS
        print(f"Station {self.station_id} waits for {delay} bits after attempt {self.attempts}")
        return delay

    def attempt_transmission(self, data):
        while True:
            wait_time = random.randint(0, SLOT_TIME_BITS)
            print(f"Station {self.station_id} waits for {wait_time} bits before attempting")

            if self.transmit(data):
                print(f"Transmission from station {self.station_id} completed!")
                return True  # Successful transmission

            self.attempts += 1
            if self.attempts > self.max_attempts:
                print(f"Transmission failed after {self.attempts} attempts")
                return False  # Transmission failed

            backoff_time = self.backoff()
            self.wait_for_backoff(backoff_time)

    def wait_for_backoff(self, backoff_time):
        # Simulate waiting for backoff time
        print(f"Station {self.station_id} waits for {backoff_time} bits during backoff")
        # Here you can implement actual waiting, for simplicity, I'm just printing a message.


# Define slot time and collision enforcement jam size
SLOT_TIME_BITS = 512
JAM_SIGNAL_BITS = 32

# Example usage
station = CSMA_CD(station_id=1, collision_probability=0.2, max_attempts=16)
data = "Sample data"
station.attempt_transmission(data)
