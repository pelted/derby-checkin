class Racer < ApplicationRecord
  enum rank: { other: 0, lion: 1, tiger: 2, wolf: 3, bear: 4, webelos: 5, arrow_of_light: 6 }
end
