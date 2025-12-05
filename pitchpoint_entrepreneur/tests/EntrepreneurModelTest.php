<?php

use PHPUnit\Framework\TestCase;

class EntrepreneurModelTest extends TestCase
{
    private string $actionsPath;

    protected function setUp(): void
    {
        parent::setUp();
        $this->actionsPath = __DIR__ . '/../actions';
    }

    public function testActionsFolderExists()
    {
        $this->assertDirectoryExists(
            $this->actionsPath,
            'Entrepreneur actions folder should exist'
        );
    }
}
