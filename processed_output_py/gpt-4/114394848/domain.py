Python
from py2pddl import Domain, create_type
from py2pddl import predicate, action

class HackingDomain(Domain):

    System = create_type("System")
    Port = create_type("Port")
    User = create_type("User")

    @predicate(System)
    def system_secured(self, s):
        pass

    @predicate(System, Port)
    def port_open(self, s, p):
        pass

    @predicate(User, System)
    def user_auth(self, u, s):
        pass

    @predicate(User, System)
    def monitoring(self, u, s):
        pass

    @predicate(User, System)
    def backdoor_installed(self, u, s):
        pass

    @action(System, Port)
    def scan_ports(self, s, p):
        precond = [self.system_secured(s)]
        effect = [self.port_open(s, p)]
        return precond, effect

    @action(User, System, Port)
    def exploit_port(self, u, s, p):
        precond = [self.port_open(s, p)]
        effect = [~self.system_secured(s), self.user_auth(u, s)]
        return precond, effect

    @action(User, System)
    def install_backdoor(self, u, s):
        precond = [self.user_auth(u, s)]
        effect = [self.backdoor_installed(u, s)]
        return precond, effect

    @action(User, System)
    def monitor_system(self, u, s):
        precond = [self.user_auth(u, s)]
        effect = [self.monitoring(u, s)]
        return precond, effect

    @action(User, System)
    def hide_tracks(self, u, s):
        precond = [self.monitoring(u, s), self.user_auth(u, s)]
        effect = [~self.monitoring(u, s)]
        return precond, effect
