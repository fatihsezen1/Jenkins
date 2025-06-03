#include <gtest/gtest.h>
#include "add.h"

TEST(AddTest, PositiveNumbers) {
    EXPECT_EQ(add(2, 3), 5);
}

TEST(AddTest, Zero) {
    EXPECT_EQ(add(0, 0), 0);
}

TEST(AddTest, NegativeNumbers) {
    EXPECT_EQ(add(-1, -2), -3);
}