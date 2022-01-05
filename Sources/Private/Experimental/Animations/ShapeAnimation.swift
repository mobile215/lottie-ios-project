// Created by Cal Stephens on 12/21/21.
// Copyright © 2021 Airbnb Inc. All rights reserved.

import QuartzCore

extension CALayer {
  /// Adds animations for the given `Shape` to this `CALayer`
  func addAnimations(
    for shape: Shape,
    context: LayerAnimationContext)
  {
    addAnimation(
      for: .path,
      keyframes: shape.path.keyframes,
      value: { pathKeyframe in
        pathKeyframe.cgPath()
      },
      context: context)
  }
}
