#include "gtest/gtest.h"

class UtilsTest : public testing::Test
{
public:
    static void SetUpTestCase() {

    }

    static void TearDownTestCase() {

    }
};

TEST_F(UtilsTest, test1) 
{
    ASSERT_EQ(1, 1);
}
