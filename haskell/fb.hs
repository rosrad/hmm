import HMM

import Data.List
import Numeric.Container

--backward algorithm
backward :: HMM -> [Emission] -> [Dist]
backward hmm = scanr (flip (backwardStep hmm)) (uniform $ numStates hmm)

backwardStep :: HMM -> Dist -> Emission -> Dist
backwardStep hmm dist emiss = normalize $ (transProbs hmm) <> (diag $ emissDist hmm emiss) <> dist

--forward algorithm
forward :: HMM -> Dist -> [Emission] -> [Dist]
forward hmm = scanl (forwardStep hmm)

forwardStep :: HMM -> Dist -> Emission -> Dist
forwardStep hmm dist emiss = normalize $ dist <> (transProbs hmm) <> (diag $ emissDist hmm emiss)

--forward-backward algorithm
fb :: HMM -> Dist -> [Emission] -> [Dist]
fb hmm dist emissions = zipWith (curry (normalize . (uncurry mul))) (forward hmm dist emissions) (backward hmm emissions)