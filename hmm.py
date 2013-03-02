import numpy as np

class HMM:
    #constructor
    def __init__(self, transition_probs, emission_probs):
        self._transition_probs = transition_probs
        self._emission_probs = emission_probs

    #accessors
    def emission_dist(self, emission):
        return self._emission_probs[:, emission]

    def transition_probs(self):
        return self._transition_probs
