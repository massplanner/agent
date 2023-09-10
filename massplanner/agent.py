import threading
import time

from prompt_toolkit import PromptSession
from prompt_toolkit.patch_stdout import patch_stdout

from massplanner.common import BaseAgent

class CampaignAgent(BaseAgent):
    def _run(self):
        while not self._stop_event.is_set():
            print(f"{self.name}: CampaignAgent")
            time.sleep(1)


class ContactAgent(BaseAgent):
    def _run(self):
        while not self._stop_event.is_set():
            print(f"{self.name}: ContactAgent")
            time.sleep(1)


class MassPlannerInstance:
    def __init__(self):
        self.agents: dict[BaseAgent] = {
            'campaign': CampaignAgent("CampaignAgent"),
            'contact': ContactAgent("ContactAgent")
        }

    def start_agent(self, agent_name):
        agent: BaseAgent = self.agents.get(agent_name)
        if agent:
            agent.start()
        else:
            print(f"No agent named {agent_name} found!")

    def stop_agent(self, agent_name):
        agent: BaseAgent = self.agents.get(agent_name)
        if agent:
            agent.stop()
        else:
            print(f"No agent named {agent_name} found!")

    def stop_all(self):
        for agent in self.agents.values():
            agent.stop()


class MassPlannerAgent:
    def __init__(self):
        self.instance = MassPlannerInstance()
        self.session  = PromptSession()

    def start(self):
        with patch_stdout():
            monitor_thread = threading.Thread(target=self.monitor)
            monitor_thread.daemon = True  # Daemon threads exit when the program exits
            monitor_thread.start()

            while True:
                user_input = self.session.prompt(
                    "Enter command (start <agent_name>, stop <agent_name>, stop_all, exit): ")
                self.handle_command(user_input.strip().lower())

    def monitor(self):
        while True:
            print("Monitoring real-time updates...")
            time.sleep(2)

    def handle_command(self, command):
        commands = command.split()
        if commands[0] == "start":
            self.instance.start_agent(commands[1])
        elif commands[0] == "stop":
            self.instance.stop_agent(commands[1])
        elif commands[0] == "stop_all":
            self.instance.stop_all()
        elif commands[0] == "exit":
            self.instance.stop_all()
            exit()

