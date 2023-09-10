import threading

class BaseAgent:
    def __init__(self, name):
        self.name = name
        self._stop_event = threading.Event()
        self._thread = None

    def start(self):
        if self._thread and self._thread.is_alive():
            print(f"{self.name} already running!")
            return

        self._stop_event.clear()
        self._thread = threading.Thread(target=self._run)
        self._thread.start()

    def stop(self):
        if self._thread and self._thread.is_alive():
            self._stop_event.set()
            self._thread.join()

    def _run(self):
        raise NotImplementedError