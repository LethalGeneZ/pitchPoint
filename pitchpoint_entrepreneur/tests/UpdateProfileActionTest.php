<?php

use PHPUnit\Framework\TestCase;

class UpdateProfileActionTest extends TestCase
{
    private string $updateProfilePath;

    protected function setUp(): void
    {
        parent::setUp();
        // update_profile.php is in: pitchpoint_entrepreneur/actions/update_profile.php
        $this->updateProfilePath = __DIR__ . '/../actions/update_profile.php';
    }

    public function testUpdateProfileFileExists()
    {
        $this->assertFileExists(
            $this->updateProfilePath,
            'update_profile.php should exist in the actions folder to handle profile updates'
        );
    }
}
