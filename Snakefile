from snakemake.remote.S3 import RemoteProvider as S3RemoteProvider              
s3_key_id = os.environ.get('AWS_ACCESS_KEY')                                    
s3_access_key = os.environ.get('AWS_SECRET_KEY')                                
                                                                                
S3 = S3RemoteProvider(                                                          
    endpoint_url='https://s3.msi.umn.edu',                                      
    access_key_id=s3_key_id,                                                    
    secret_access_key=s3_access_key                                             
)


rule DOWNLOAD_GFF:
    input:
        S3.remote('GFFs/EquCab3.nice.gff')
    output:
        gff='data/EquCab3.nice.gff'
    shell:
        'cp {input} {output}'
