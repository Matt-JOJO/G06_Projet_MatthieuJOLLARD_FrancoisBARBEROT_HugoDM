const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "eu-west-3:a0e35c4f-1ae8-4d9e-a808-720ca7c15a00",
                            "Region": "eu-west-3"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "eu-west-3_snkoQSJmf",
                        "AppClientId": "7c33h8dtc2ofesura9kc1f6bq5",
                        "Region": "eu-west-3"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH",
                        "socialProviders": [],
                        "usernameAttributes": [
                            "EMAIL"
                        ],
                        "signupAttributes": [
                            "EMAIL"
                        ],
                        "passwordProtectionSettings": {
                            "passwordPolicyMinLength": 8,
                            "passwordPolicyCharacters": []
                        },
                        "mfaConfiguration": "OFF",
                        "mfaTypes": [
                            "SMS"
                        ],
                        "verificationMechanisms": [
                            "EMAIL"
                        ]
                    }
                },
                "DynamoDBObjectMapper": {
                    "Default": {
                        "Region": "eu-west-3"
                    }
                }
            }
        }
    },
    "storage": {
        "plugins": {
            "awsDynamoDbStoragePlugin": {
                "partitionKeyName": "Id_user",
                "region": "eu-west-3",
                "arn": "arn:aws:dynamodb:eu-west-3:283745394622:table/dynamoTestApiSteamApp-dev",
                "streamArn": "arn:aws:dynamodb:eu-west-3:283745394622:table/dynamoTestApiSteamApp-dev/stream/2023-03-15T16:38:32.470",
                "partitionKeyType": "S",
                "name": "dynamoTestApiSteamApp-dev"
            }
        }
    }
}''';